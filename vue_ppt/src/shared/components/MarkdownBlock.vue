<template>
  <div class="markdown-body" :class="{ prose }" v-html="html"></div>
</template>

<script setup lang="ts">
import { computed } from 'vue'

const props = withDefaults(defineProps<{
  content: string
  prose?: boolean
}>(), {
  prose: true
})

const escapeHtml = (s: string) => s
  .replace(/&/g, '&amp;')
  .replace(/</g, '&lt;')
  .replace(/>/g, '&gt;')

function renderInline(text: string): string {
  // links [text](url)
  text = text.replace(/\[([^\]]+)]\(([^)]+)\)/g, '<a href="$2" target="_blank" rel="noopener">$1<\/a>')
  // url(http...)
  text = text.replace(/\burl\((https?:\/\/[^)]+)\)/g, '<a href="$1" target="_blank" rel="noopener">$1<\/a>')
  // bold **text**
  text = text.replace(/\*\*([^*]+)\*\*/g, '<strong>$1<\/strong>')
  // italic *text*
  text = text.replace(/(^|\W)\*([^*]+)\*(?=\W|$)/g, '$1<em>$2<\/em>')
  // inline code `code`
  text = text.replace(/`([^`]+)`/g, '<code>$1<\/code>')
  return text
}

function renderMarkdown(md: string): string {
  const src = escapeHtml(md).replace(/\r\n?/g, '\n')
  const lines = src.split('\n')
  let out: string[] = []
  let i = 0
  let inList = false
  let inCode = false
  let codeBuffer: string[] = []

  const closeList = () => { if (inList) { out.push('</ul>'); inList = false } }
  const closeCode = () => { if (inCode) { out.push(`<pre><code>${codeBuffer.join('\n')}</code></pre>`); inCode = false; codeBuffer = [] } }

  while (i < lines.length) {
    const raw = lines[i]
    const line = raw
    // fenced code
    if (/^\s*```/.test(line)) {
      if (inCode) { closeCode(); i++; continue }
      inCode = true; codeBuffer = []; i++; continue
    }
    if (inCode) { codeBuffer.push(line); i++; continue }

    // table: GitHub pipe table (|h1|h2| ... with separator row)
    if (/^\s*\|/.test(line)) {
      closeList()
      const tbl: string[] = []
      while (i < lines.length && /^\s*\|/.test(lines[i])) { tbl.push(lines[i]); i++ }

      const parseRow = (row: string) => {
        // trim leading/trailing pipes and split
        const trimmed = row.trim().replace(/^\|/, '').replace(/\|$/, '')
        return trimmed.split('|').map(c => c.trim())
      }

      const isSep = (row: string) => {
        const t = row.trim()
        // allow optional leading/trailing '|', cells are --- or :---: etc
        const inner = t.replace(/^\|/, '').replace(/\|$/, '')
        return inner.split('|').every(cell => /^\s*:?-{3,}:?\s*$/.test(cell))
      }

      let thead: string[] = []
      let tbody: string[] = []
      if (tbl.length >= 2 && isSep(tbl[1])) {
        const headers = parseRow(tbl[0]).map(h => renderInline(h))
        thead.push('<tr>' + headers.map(h => `<th>${h}</th>`).join('') + '</tr>')
        for (let r = 2; r < tbl.length; r++) {
          const cells = parseRow(tbl[r]).map(c => renderInline(c).replace(/\\\\n/g, '<br/>'))
          tbody.push('<tr>' + cells.map(c => `<td>${c}</td>`).join('') + '</tr>')
        }
      } else {
        // no separator given; treat all rows as body with th for first row
        const rows = tbl.map(parseRow)
        if (rows.length) {
          thead.push('<tr>' + rows[0].map(h => `<th>${renderInline(h)}</th>`).join('') + '</tr>')
          for (let r = 1; r < rows.length; r++) {
            const cells = rows[r].map(c => renderInline(c).replace(/\\\\n/g, '<br/>'))
            tbody.push('<tr>' + cells.map(c => `<td>${c}</td>`).join('') + '</tr>')
          }
        }
      }
      out.push(`<table class="md-table"><thead>${thead.join('')}</thead><tbody>${tbody.join('')}</tbody></table>`)
      continue
    }

    // hr
    if (line.trim() === '---') { closeList(); out.push('<hr />'); i++; continue }

    // headings #, ##, ### mapped to h3/h4/h5 for slide scale
    const h = line.match(/^\s*(#{1,3})\s+(.+)/)
    if (h) {
      closeList()
      const level = h[1].length
      const tag = level === 1 ? 'h3' : level === 2 ? 'h4' : 'h5'
      out.push(`<${tag}>${renderInline(h[2])}</${tag}>`)
      i++; continue
    }

    // list items: -, *, + or bullet •
    const m = line.match(/^\s*(?:[-*+]\s+|•\s+)(.+)/)
    if (m) {
      if (!inList) { out.push('<ul>'); inList = true }
      out.push(`<li>${renderInline(m[1])}</li>`)
      i++; continue
    }

    // blank line
    if (line.trim() === '') { closeList(); out.push('<br />'); i++; continue }

    // paragraph
    closeList()
    out.push(`<p>${renderInline(line)}</p>`)
    i++
  }

  closeList(); closeCode()
  return out.join('\n')
}

const html = computed(() => renderMarkdown(props.content))
</script>

<style scoped>
.markdown-body {
  color: #1f2937;
}
.markdown-body :deep(h3) { font-size: clamp(1.15rem, 2.2vw, 1.4rem); font-weight: 800; margin: 0.2rem 0 0.6rem; color: #0f172a; }
.markdown-body :deep(h4) { font-size: clamp(1.05rem, 2vw, 1.2rem); font-weight: 700; margin: 0.2rem 0 0.5rem; color: #0f172a; }
.markdown-body :deep(p) { margin: 0.3rem 0; line-height: 1.65; }
.markdown-body :deep(ul) { margin: 0.4rem 0 0.6rem 1.2rem; padding: 0; }
.markdown-body :deep(li) { margin: 0.25rem 0; }
.markdown-body :deep(code) { background: rgba(15, 23, 42, 0.06); padding: 0.1rem 0.3rem; border-radius: 4px; font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace; font-size: 0.95em; }
.markdown-body :deep(pre) { background: rgba(15, 23, 42, 0.04); border: 1px solid rgba(148, 163, 184, 0.24); padding: 0.75rem 0.9rem; border-radius: 10px; overflow: auto; }
.markdown-body :deep(table.md-table) { width: 100%; border-collapse: collapse; table-layout: auto; }
.markdown-body :deep(table.md-table thead th) { background: rgba(15, 23, 42, 0.05); font-weight: 700; }
.markdown-body :deep(table.md-table th),
.markdown-body :deep(table.md-table td) { border: 1px solid rgba(148, 163, 184, 0.35); padding: 0.5rem 0.65rem; vertical-align: top; }
.markdown-body :deep(table.md-table tr:nth-child(even) td) { background: rgba(15, 23, 42, 0.02); }
.markdown-body :deep(a) { color: #2563eb; text-decoration: underline; }
</style>
