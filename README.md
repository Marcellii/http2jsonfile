# http2jsonfile

microservice with a sinatra http listener, that updates a local json file

## Usage

### Get all hashtags

```bash
curl -H "Accept: application/json" http://127.0.0.1:4567/json
```

returns:

```json
{
  "hashtags": [
    "tatort",
    "jamaika",
    "svwh96",
    "rannfl",
    "aldi",
    "berlindirekt",
    "lidl",
    "werder",
    "bahn",
    "jamaikasondierung"
  ]
}
```

### Update hashtags

```bash
curl -X POST -H "Accept: application/json" -d  '{"hashtags":["tatort","jamaika","svwh96","rannfl","aldi","berlindirekt","lidl","werder","bahn","jamaikasondierung"]}' http://127.0.0.1:4567/json
```

returns:

```json
{
  "hashtags": [
    "tatort",
    "jamaika",
    "svwh96",
    "rannfl",
    "aldi",
    "berlindirekt",
    "lidl",
    "werder",
    "bahn",
    "jamaikasondierung"
  ]
}
```

### Delete all hashtags

```bash
curl -X DELETE -H "Accept: application/json" http://127.0.0.1:4567/json
```

```json
{
  "hashtags": [

  ]
}
```
