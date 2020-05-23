const path = require('path');
const themeDir = path.resolve(__dirname);
const postcssPresetEnv = require('postcss-preset-env');
const purgecss = require('@fullhuman/postcss-purgecss')({
    content: [
        path.resolve(themeDir, 'layouts/**/*.html'),
        'layouts/**/*.html',
        'content/**/*.html',
    ],

    defaultExtractor: (content) => {
        const broadMatches = content.match(/[^<>"'`\s]*[^<>"'`\s:]/g) || [];
        const innerMatches =
            content.match(/[^<>"'`\s.()]*[^<>"'`\s.():]/g) || [];
        return broadMatches.concat(innerMatches);
    },
});

module.exports = {
    plugins: [
        require('postcss-import')({
            path: [
                path.resolve(themeDir, 'node_modules'),
                path.resolve(themeDir, 'assets/css'),
            ],
        }),
        require('tailwindcss')(path.resolve(themeDir, 'tailwind.config.js')),
        postcssPresetEnv({
            stage: 3,
            features: {
                'nesting-rules': true,
                'custom-properties': true,
            },
            autoprefixer: {
                path: [themeDir],
            },
        }),
        ...(process.env.HUGO_ENVIRONMENT == 'production' ? [purgecss] : []),
    ],
};
