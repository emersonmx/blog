const path = require('path');
const themeDir = path.resolve(__dirname);

const tailwindConfig = path.resolve(themeDir, "tailwind.config.js");

module.exports = {
    plugins: [
        require('postcss-import')({
            path: [
                path.resolve(themeDir, 'node_modules'),
                path.resolve(themeDir, 'assets/css'),
            ],
        }),
        require('tailwindcss')(tailwindConfig),
        require('autoprefixer'),
        ...(
            process.env.HUGO_ENVIRONMENT === 'production'
                ? [require('cssnano')]
                : []
        )
    ]
}
