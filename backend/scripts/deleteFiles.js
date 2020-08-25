// script to cleanup and remove files from COS
const fetch = require('node-fetch')
var options = {
  method: "POST",
  body: JSON.stringify({"emailAddress": "foo@bar.net"}),
  headers: { 'Content-Type': 'application/json' }
}
fetch('http://localhost:8081/queryAllDigitalAssets', options).then ( (res) => {
  console.log(res)
  res.json().then ((r) => {
    console.log(r)
    var ids = r.map( asset => asset.Key )
    console.log(ids)
    ids.map( (id) => {
      var options = {
        method: "POST",
        body: JSON.stringify({
          "emailAddress": "foo@bar.net",
          "assetId": id
        }),
        headers: { 'Content-Type': 'application/json' }
      }
      fetch('http://localhost:8081/deleteDigitalAsset', options).then ( (res) => {
        res.json( ).then(r => console.log(r) )
      })
    })
  })
})

// curl -H "Content-Type: application/json" -X POST -d '{"assetId": "c9709f20-dd1e-11ea-afe4-6d0021dffa17", "emailAddress": "foo@bar.net"}' localhost:8081/queryAllDigitalAssets | jq .
