module.exports = {
  pages: {
    index: {
      entry: 'src/main.js', //entry for the public page
      // template: 'public/index.html', // source template
      // filename: 'index.html' // output as dist/*
    },
    login: {
      entry: 'src/login/main.js',
      template: 'public/login.html',
      filename: 'login.html'
    },
    // witness: {
      // entry: 'src/witness/main.js',
      // template: 'public/login.html',
      // filename: 'login.html'
    // }
  },
  devServer: {
    historyApiFallback: {
      rewrites: [
        { from: /\/index/, to: '/' },
        { from: /\/login/, to: '/login.html' },
        // { from: /\/witness/, to: '/' },
      ]
    }
  },
  chainWebpack: config => {
    config.module
      .rule('vue')
      .use('vue-loader')
        .loader('vue-loader')
        .tap(options => {
          options.prettify = false
          // options.hotReload = false // disables Hot Reload // TODO, isn't working here
          return options
        })
  }
}
