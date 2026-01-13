# Pandoc Fundamentals

## What is Pandoc?

Pandoc is a universal document converter that can transform documents between numerous markup formats. Originally created by John MacFarlane, it has become the de facto standard for converting between different document formats, particularly excelling in converting Markdown to various output formats including PDF, HTML, Word, and LaTeX.

## Key Features and Capabilities

Pandoc offers extensive functionality that makes it ideal for professional documentation:

- **Format Conversion**: Supports over 40 input and output formats
- **Template System**: Customizable templates for consistent formatting
- **Citation Management**: Built-in support for bibliographies and citations
- **Cross-referencing**: Automatic numbering and referencing of figures, tables, and sections
- **Code Highlighting**: Syntax highlighting for numerous programming languages
- **Mathematical Notation**: LaTeX-style math rendering

## Installation Requirements

| Component          | Purpose                | Windows Installation      |
| ------------------ | ---------------------- | ------------------------- |
| Pandoc             | Core conversion engine | Download from pandoc.org  |
| LaTeX Distribution | PDF generation         | MiKTeX or TeX Live        |
| Text Editor        | Markdown editing       | VS Code, Atom, or similar |

: Essential components for Pandoc documentation workflow

## Basic Command Structure

The fundamental Pandoc command follows this pattern:

```bash
pandoc [input-file] -o [output-file] [options]
```

### Common Options

- `--template`: Specify a custom template
- `--toc`: Generate table of contents
- `--number-sections`: Add section numbering
- `--pdf-engine`: Choose PDF generation engine (xelatex, pdflatex)
- `--highlight-style`: Set code syntax highlighting theme

## Document Metadata

Pandoc uses YAML metadata blocks to control document properties and formatting. These blocks are placed at the beginning of documents and contain configuration options for:

- Document title and author information
- Template variables and styling options
- Table of contents and section numbering settings
- PDF-specific formatting parameters

![Pandoc's internal architecture showing the conversion pipeline](https://placehold.co/600x400/EDEDED/555.png?text=Pandoc+Architecture+Diagram)

## Supported Input and Output Formats

Pandoc's versatility comes from its extensive format support:

**Input Formats**: Markdown, HTML, LaTeX, Word docx, OpenDocument, EPUB, and many others
**Output Formats**: PDF, HTML, LaTeX, Word docx, PowerPoint pptx, EPUB, and numerous academic formats

This flexibility allows for seamless integration into existing documentation workflows and future format migrations.
