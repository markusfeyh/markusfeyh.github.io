#!/bin/bash

# Deploy script for Markus Feyh's Blog
# This script helps set up the repository for GitHub Pages

echo "🚀 Setting up Markus Feyh's Blog for GitHub Pages deployment..."

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "📁 Initializing git repository..."
    git init
    git add .
    git commit -m "Initial commit: Jekyll blog setup"
    echo "✅ Git repository initialized"
else
    echo "📁 Git repository already exists"
fi

echo ""
echo "📋 Next steps to deploy to GitHub Pages:"
echo ""
echo "1. Create a new repository on GitHub named 'markusfeyh.github.io'"
echo "2. Add the remote origin:"
echo "   git remote add origin https://github.com/markusfeyh/markusfeyh.github.io.git"
echo "3. Push to GitHub:"
echo "   git push -u origin main"
echo "4. Go to repository Settings > Pages"
echo "5. Set Source to 'GitHub Actions'"
echo "6. Your site will be available at: https://markusfeyh.github.io"
echo ""
echo "🌐 To use your custom domain (markusfeyh.com):"
echo "1. Add CNAME record pointing to markusfeyh.github.io"
echo "2. Enable custom domain in GitHub Pages settings"
echo "3. Wait for DNS propagation (can take up to 24 hours)"
echo ""
echo "✨ The GitHub Actions workflow will automatically build and deploy your site!" 