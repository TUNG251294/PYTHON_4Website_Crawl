const path = require('path');

module.exports = {
  output: {
    filename: 'js/[name].[contenthash:8].js',
    path: path.resolve(__dirname, 'build'),
    publicPath: '/',
  },
  module: {
    rules: [
      {
        test: /\.(png|jpe?g|gif)$/i,
        use: [
          {
            loader: 'file-loader',
            options: {
              name: '[name].[ext]',
              esModule: false,
            },
          },
        ],
      },
    ],
  },
};




