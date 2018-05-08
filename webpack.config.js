// 설정 파일
const nodeExternals = require('webpack-node-externals')

module.exports = {
    target: 'node',
    externals: [nodeExternals()],
}