# Markus Feyh's Blog

A personal blog built with Jekyll and hosted on GitHub Pages, focusing on software development and finance topics.

## Features

- Clean, responsive design using the minima theme
- Blog posts about Erlang, Ruby, and software architecture
- About and contact pages
- RSS feed support
- SEO optimized
- Automatic deployment via GitHub Actions

## Quick Start

### Option 1: Automated Setup (Recommended)

1. Run the deployment script:
   ```bash
   ./deploy.sh
   ```

2. Follow the printed instructions to create the GitHub repository and push your code.

### Option 2: Manual Setup

1. Create a new repository on GitHub named `markusfeyh.github.io`
2. Initialize git and add your remote:
   ```bash
   git init
   git add .
   git commit -m "Initial commit: Jekyll blog setup"
   git remote add origin https://github.com/markusfeyh/markusfeyh.github.io.git
   git push -u origin main
   ```
3. Go to repository Settings > Pages
4. Set Source to "GitHub Actions"
5. Your site will be automatically built and deployed

## Custom Domain Setup

To use your custom domain `markusfeyh.com`:

1. **DNS Configuration**: Add a CNAME record pointing to `markusfeyh.github.io`
   - Type: CNAME
   - Name: @ (or leave blank for root domain)
   - Value: markusfeyh.github.io
   - TTL: 3600 (or default)

2. **GitHub Pages Settings**: 
   - Go to repository Settings > Pages
   - Enter `markusfeyh.com` in the Custom domain field
   - Save the changes

3. **Wait for Propagation**: DNS changes can take up to 24 hours to propagate

## Content Management

### Adding New Blog Posts

Create new files in `_posts/` directory with the format:
```
YYYY-MM-DD-title.md
```

Example:
```markdown
---
layout: post
title: "Your Post Title"
date: 2024-01-15
author: Markus Feyh
categories: [Category]
tags: [tag1, tag2]
---

Your post content here...
```

### Adding New Pages

Create new `.md` files in the root directory with front matter:
```markdown
---
layout: page
title: Page Title
permalink: /page-url/
---

Page content here...
```

### Customizing the Theme

- Modify `_config.yml` for site-wide settings
- Edit `_layouts/` for custom page layouts
- Update `_includes/` for reusable components
- Add custom CSS in `assets/css/`

## Local Development

### Prerequisites

- Ruby 2.7 or higher (recommended: Ruby 3.1+)
- Bundler gem

### Setup

1. Install dependencies:
   ```bash
   bundle install
   ```

2. Start the local server:
   ```bash
   bundle exec jekyll serve
   ```

3. Visit `http://localhost:4000` in your browser

**Note**: If you encounter Ruby compatibility issues locally, don't worry! The site will build successfully on GitHub Pages using the GitHub Actions workflow.

## Deployment

The site automatically deploys when you push to the `main` branch. The GitHub Actions workflow:

1. Sets up a Ruby 3.1 environment
2. Installs all dependencies
3. Builds the Jekyll site
4. Deploys to GitHub Pages

## Troubleshooting

### Common Issues

1. **Build Failures**: Check the GitHub Actions tab for detailed error logs
2. **Custom Domain Not Working**: Verify DNS settings and wait for propagation
3. **Local Build Issues**: Use GitHub Actions for building instead

### Support

- Check [GitHub Pages documentation](https://docs.github.com/en/pages)
- Review [Jekyll documentation](https://jekyllrb.com/docs/)
- Check the Actions tab in your repository for build logs

## License

This project is open source and available under the [MIT License](LICENSE).

## Credits

- Built with [Jekyll](https://jekyllrb.com/)
- Theme: [Minima](https://github.com/jekyll/minima)
- Hosted on [GitHub Pages](https://pages.github.com/) 