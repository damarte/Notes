# Postman

## Test

Definimos las siguientes variables globales (o de entorno, según se quiera)

`commonTests`

````javascript
() => {
    tests["Status code is 200"] = responseCode.code === 200;
    tests["Response time is acceptable"] = responseTime < 500; // milisegundos
    tests["Content-Type header is JSON"] = postman.getResponseHeader("Content-Type") === "application/json; charset=UTF-8";
}
````

`indexTests`

````javascript
() => {
    try {
        var data = JSON.parse(responseBody);
        tests["Response is a valid JSON"] = true;
        tests["Response has a modified key"] = 'modified' in data;
        tests["Response has a deleted key"] = 'deleted' in data;
    } catch (e) {
        tests["Response is a valid JSON"] = false;
    }
}
````

Tambien podemos definirlas en la primera de las peticiones que se van a ejecutar:

````javascript
postman.setGlobalVariable("commonTests", () => { <code> }); // postman.setEnvironmentVariable("commonTests", () => { <code> });
````

Ejecutamos los test comunes

````javascript
eval(globals.commonTests)(); // eval(environment.commonTests)();
eval(globals.indexTests)(); // eval(environment.indexTests)();
````

Definir el orden de ejecución para saltarnos las peticiones por post ya que ahí hay que especificar datos de prueba

````javascript
postman.setNextRequest(<request_name>); // por ejemplo "Attributes/index"
postman.setNextRequest(null); // para terminar con esa peticion
````
