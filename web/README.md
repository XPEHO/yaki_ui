# Yaki_UI Web Components

# For now : Install the npm package :

In the project use :

```
npm install "https://gitpkg.now.sh/XPEHO/yaki_ui/web?feat/web_admin_ui"
```

This will install the npm package from github in the current project.

All change related to web components will be done in the **web** folder of the **yaki_ui** repository, and on the **web_admin_ui** branch,
Or at least PR related to web components will be merged on that branch.

### Description

Yaki_UI is a collection of web components based on BastiUI work. It's designed to provide a set of reusable UI components for web development.

Installation
To install this package, you can use :

```
npm install @yaki_ui/yaki_ui_web_components
```

# Hosting and Updating NPM Packages on GitHub

Create a **.npmrc** file in the root of your project with the following contents:

```
registry=https://npm.pkg.github.com/ORGANIZATION_NAME or REPO_NAME or USER_NAME
//npm.pkg.github.com/:_authToken=YOUR_GITHUB_TOKEN
```

Replace **YOUR_GITHUB_TOKEN** with a personal access token from GitHub. You can create a new token in your GitHub account settings.

# Updating NPM Packages on GitHub

To update a package on GitHub, you need to update the version number in the package.json file

Create a pull request and merge it into the main branch.

# CI change :

Once the npm package will be hosted on github package, the CI could be changed this way to update the package after an accepted pull request

```
 npm-update:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2

      - name: Use Node.js
        uses: actions/setup-node@v2
        with:
          node-version: "14"
          registry-url: "https://npm.pkg.github.com"
          scope: "@yaki_ui"

      - name: Publish
        run: npm publish
        env:
          NODE_AUTH_TOKEN: ${{secrets.TOKEN_NPM_PACKAGE}}
```

the TOKEN_NPM_PACKAGE is a secret variable that you can create in the settings of your github repository
It should have the write package permission
