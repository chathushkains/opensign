# OpenSign Vercel Deployment Guide

This guide will help you deploy the OpenSign frontend to Vercel.

## Prerequisites

1. A Vercel account (free tier available)
2. The OpenSign backend deployed separately (see Backend Deployment section)
3. A MongoDB database (MongoDB Atlas recommended)

## Frontend Deployment to Vercel

### Step 1: Prepare the Repository

1. Ensure you're in the OpenSign project root directory
2. The `vercel.json` configuration file is already created

### Step 2: Deploy to Vercel

#### Option A: Using Vercel CLI

1. Install Vercel CLI:
   ```bash
   npm i -g vercel
   ```

2. Login to Vercel:
   ```bash
   vercel login
   ```

3. Deploy from the project root:
   ```bash
   vercel
   ```

4. Follow the prompts:
   - Set up and deploy? `Y`
   - Which scope? Choose your account
   - Link to existing project? `N`
   - Project name: `opensign-frontend` (or your preferred name)
   - Directory: `./apps/OpenSign`
   - Override settings? `N`

#### Option B: Using Vercel Dashboard

1. Go to [vercel.com](https://vercel.com)
2. Click "New Project"
3. Import your Git repository
4. Configure the project:
   - Framework Preset: `Vite`
   - Root Directory: `apps/OpenSign`
   - Build Command: `npm run build`
   - Output Directory: `build`
   - Install Command: `npm install`

### Step 3: Configure Environment Variables

In your Vercel project dashboard, go to Settings > Environment Variables and add:

```
REACT_APP_SERVER_URL=https://your-backend-url.com/api/app
REACT_APP_PUBLIC_URL=https://your-vercel-app.vercel.app
REACT_APP_APP_ID=your-app-id
REACT_APP_MASTER_KEY=your-master-key
```

Replace the values with your actual backend URL and Parse Server configuration.

## Backend Deployment (Required)

The OpenSign backend needs to be deployed separately since Vercel is primarily for frontend applications. Here are recommended options:

### Option 1: Railway
1. Go to [railway.app](https://railway.app)
2. Connect your GitHub repository
3. Deploy the `apps/OpenSignServer` directory
4. Configure environment variables for MongoDB and other services

### Option 2: Render
1. Go to [render.com](https://render.com)
2. Create a new Web Service
3. Connect your repository and select the `apps/OpenSignServer` directory
4. Configure build and start commands

### Option 3: Heroku
1. Create a new Heroku app
2. Set the buildpack to Node.js
3. Deploy the `apps/OpenSignServer` directory
4. Configure environment variables

## Database Setup

1. Create a MongoDB Atlas account (free tier available)
2. Create a new cluster
3. Get your connection string
4. Configure the backend with your MongoDB connection string

## File Storage Setup

For production, you'll need to configure file storage:

### Option 1: AWS S3
- Create an S3 bucket
- Configure AWS credentials in your backend environment variables

### Option 2: DigitalOcean Spaces
- Create a DigitalOcean Space
- Configure the credentials in your backend environment variables

## Testing the Deployment

1. Deploy the frontend to Vercel
2. Deploy the backend to your chosen platform
3. Update the frontend environment variables with your backend URL
4. Test the application functionality

## Troubleshooting

### Common Issues

1. **Build Failures**: Ensure all dependencies are properly installed
2. **API Connection Issues**: Verify the backend URL in environment variables
3. **CORS Issues**: Configure CORS settings in your backend
4. **File Upload Issues**: Ensure file storage is properly configured

### Support

- Check the [OpenSign Documentation](https://docs.opensignlabs.com)
- Visit the [OpenSign GitHub Repository](https://github.com/OpenSignLabs/OpenSign)
- Join the [OpenSign Discord Community](https://discord.com/invite/xe9TDuyAyj)

## Notes

- The frontend is a static React application that can be deployed to Vercel
- The backend requires a Node.js runtime environment
- MongoDB is required for data persistence
- File storage is required for document handling
- Email service configuration is needed for notifications

## Security Considerations

- Never commit sensitive environment variables to your repository
- Use environment variables for all configuration
- Enable HTTPS for all services
- Configure proper CORS settings
- Use strong passwords and API keys
