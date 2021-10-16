const { environment } = require('@rails/webpacker')

environment.config.merge({
  module: {
    rules: [
      {
        test: /\.s(c|a)ss$/,
        use: [
          'css-loader',
          {
            loader: 'sass-loader',
            // Requires sass-loader@^7.0.0
            options: {
              implementation: require('sass'),
              indentedSyntax: true // optional
            },
            // Requires >= sass-loader@^8.0.0
            options: {
              implementation: require('sass'),
              sassOptions: {
                indentedSyntax: true // optional
              },
            },
          },
        ],
      },
    ],
  }
})

module.exports = environment
