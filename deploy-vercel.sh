#!/bin/bash

# OpenSign Vercel Deployment Script
# This script helps deploy the OpenSign frontend to Vercel

set -e

echo "🚀 OpenSign Vercel Deployment Script"
echo "=================================="

# Check if Vercel CLI is installed
if ! command -v vercel &> /dev/null; then
    echo "❌ Vercel CLI is not installed. Installing..."
    npm install -g vercel
fi

# Check if user is logged in to Vercel
if ! vercel whoami &> /dev/null; then
    echo "🔐 Please log in to Vercel:"
    vercel login
fi

echo "📦 Installing dependencies..."
cd apps/OpenSign
npm install

echo "🔨 Building the application..."
npm run build

echo "🚀 Deploying to Vercel..."
cd ../..
vercel --prod

echo "✅ Deployment complete!"
echo ""
echo "📝 Next steps:"
echo "1. Configure environment variables in your Vercel dashboard"
echo "2. Deploy the backend separately (see VERCEL_DEPLOYMENT.md)"
echo "3. Set up MongoDB database"
echo "4. Configure file storage (AWS S3 or DigitalOcean Spaces)"
echo ""
echo "📖 For detailed instructions, see VERCEL_DEPLOYMENT.md"
