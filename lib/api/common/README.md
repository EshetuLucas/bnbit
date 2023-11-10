#  All api common codes goes here 

1. Class ApiClient {

   }

This class is the last layer of communication with the API, and it handles all API requests and responses, including errors. The constructor assigns headers, if any. 

        ```
        ApiClient({this.headers}) {
            dio.options.headers = headers;
            dio.options.headers.putIfAbsent("Content-Type", () => "application/json");
        }

        ```

  In General api calls return a single or a list data. So we need to create list and single data handler functions 
      
       ```
           Future<List<T>> getList<T>(
                String endpoint, {
                Map<String, dynamic>? queryParameters,
                String? key,
                String? additionalKey,
            }) async {}

          Future<T> get<T>(
                String url, {
                Map<String, dynamic>? queryParameters,
                String? key,
                String? modelKey,
                Options? options,
                        }) async {}              

       ```

These two functions initialize an API request and then call a response handler function, which takes the request and handles the response based on the given type (model).

     ```

     Future<List<T>> _handleListResponse<T>(
            Future<Response> request, {
            String? key,
            String? additionalKey,
        }) async {}

       Future<T> _handleResponse<T>(
            Future<Response> request, {
            String? key,
            String? modelKey,
        }) async {}

     ```

Two functions call an API based on the given request and then handle the response based on the given type (model). 

If the API request is successful, the handler function calls the assignType() function, which takes the parsed response and converts it to the given model.

            ```
            assignType<T>(var data) {
                switch (T) {
                case Dogs:
                    return data = Dogs.fromJson(data);
                case Breeds:
                    return data = Breeds.fromJson(data);

                default:
                }
            }```

If the API request fails, the handler function catches and handles the exception, then throws it back to the caller function.

    ```
     on DioError catch (e) {
      throw ApiErrorHandler.handleError(e);
    } catch (e) {
      log.e('Something went wrong: $e');
      rethrow;
    }
    
    ```
                
    
      



