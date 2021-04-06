function geturl() {
    if [ "$1" == "local" ]; then
        echo "http://local.foo.com:9000"
        return;
    fi
    if [ "$1" == "production" ]; then
        echo "http://api.foo.com"
        return;
    fi
    if [[ "$1" == "test"  ||  "$1" == "mob1" ]] ; then
        echo "http://dev.foo.com"
        return;
    fi
}

curl -X PATCH \
 $(getbrurl $1)//api/v1/accounts/$2/catalogs/$3/items \
   -H 'Content-Type: application/json-patch+json' \
   -H "Content-Type: application/json" \
   -H @.api-token \
   -d '[
   {
     "path": "/items/recipe.carnitas",
     "value": {}
      "op": "add"
    }
  ]
'

