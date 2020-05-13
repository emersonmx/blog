const themeDir = __dirname + '/../../';
const postcssPresetEnv = require('postcss-preset-env');
const purgecss = require('@fullhuman/postcss-purgecss')({
    content: [
        themeDir + 'layouts/**/*.html',
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
        require('postcss-import')({ path: [themeDir] }),
        require('tailwindcss')(themeDir + 'assets/css/tailwind.config.js'),
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
