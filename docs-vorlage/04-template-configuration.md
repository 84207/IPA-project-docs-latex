# Template Configuration

## Understanding the Eisvogel Template

The Eisvogel template is a professionally designed LaTeX template specifically created for Pandoc. It provides a modern, clean layout that's ideal for technical documentation, reports, and academic papers.

## Template Customization Options

### Color Scheme Configuration

The template supports extensive color customization through YAML variables:

| Variable | Purpose | Default | Example |
|----------|---------|---------|---------|
| `titlepage-color` | Background color of title page | FFFFFF | 2C5AA0 |
| `titlepage-text-color` | Text color on title page | 000000 | FFFFFF |
| `titlepage-rule-color` | Color of decorative rules | 000000 | 2C5AA0 |

: Eisvogel template color customization options

### Typography and Layout Settings

The template provides fine-grained control over document typography:

```yaml
# Font configuration
fontsize: 11pt
documentclass: report
geometry: margin=2.5cm

# Section numbering
numbersections: true
secnumdepth: 3
toc-depth: 3
```

## Header and Footer Customization

### Dynamic Content in Headers and Footers

The template supports LaTeX commands for dynamic content:

- `\leftmark`: Current chapter name
- `\rightmark`: Current section name  
- `\thepage`: Current page number
- `\pageref{LastPage}`: Total page count
- `\today`: Current date

### Professional Footer Example

```yaml
footer-left: "Vladimir Rakov | DOK_VLRA_PIPA_BERICHT.pdf | \\today"
footer-right: "Seite \\thepage"
```

![Visual breakdown of Eisvogel template components and customization areas](https://placehold.co/600x400/EDEDED/555.png?text=Eisvogel+Template+Structure)


## Logo and Branding Integration

### Logo Placement and Sizing

The template supports logo integration on the title page:

```yaml
logo: "images/company-logo.png"
logo-width: 100  # Width in points
```

### Corporate Identity Elements

For professional documentation, maintain consistent branding:

- Use corporate color schemes in `titlepage-color` settings
- Include official logos and imagery
- Apply consistent typography matching brand guidelines
- Maintain proper legal notices and copyright information

## Code Highlighting and Technical Content

### Syntax Highlighting Configuration

The template integrates with Pandoc's code highlighting system:

```yaml
listings: true
highlight-style: github  # Options: github, tango, kate, zenburn
```

### Available Highlighting Styles

The template supports numerous code highlighting themes optimized for both screen and print viewing. Popular options include:

- **github**: Clean, web-friendly highlighting
- **tango**: High contrast, print-friendly
- **kate**: Balanced colors, good readability
- **zenburn**: Dark theme alternative

## Advanced Template Modifications

For complex customization requirements, the Eisvogel template can be modified directly. This involves editing the LaTeX template file to add custom packages, modify layouts, or integrate specialized formatting requirements.

### Custom Package Integration

Add custom LaTeX packages through YAML header includes:

```yaml
header-includes:
  - \usepackage{custom-package}
  - \newcommand{\customcmd}{Custom Command}
```
