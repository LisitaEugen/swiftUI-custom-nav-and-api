//
// BeersAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



open class BeersAPI {
    /**
     Gets a beer with certain id
     
     - parameter beerId: (path) Beer id 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func beersBeerIdGet(beerId: Double, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: [Beer]?,_ error: Error?) -> Void)) {
        beersBeerIdGetWithRequestBuilder(beerId: beerId).execute(apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Gets a beer with certain id
     - GET /beers/{beerId}
     - parameter beerId: (path) Beer id 
     - returns: RequestBuilder<[Beer]> 
     */
    open class func beersBeerIdGetWithRequestBuilder(beerId: Double) -> RequestBuilder<[Beer]> {
        var path = "/beers/{beerId}"
        let beerIdPreEscape = "\(APIHelper.mapValueToPathItem(beerId))"
        let beerIdPostEscape = beerIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{beerId}", with: beerIdPostEscape, options: .literal, range: nil)
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<[Beer]>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Gets a list of beers with paginations
     
     - parameter page: (query) Page number (optional)
     - parameter perPage: (query) Number of objects per page (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func beersGet(page: Double? = nil, perPage: Double? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: [Beer]?,_ error: Error?) -> Void)) {
        beersGetWithRequestBuilder(page: page, perPage: perPage).execute(apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Gets a list of beers with paginations
     - GET /beers
     - parameter page: (query) Page number (optional)
     - parameter perPage: (query) Number of objects per page (optional)
     - returns: RequestBuilder<[Beer]> 
     */
    open class func beersGetWithRequestBuilder(page: Double? = nil, perPage: Double? = nil) -> RequestBuilder<[Beer]> {
        let path = "/beers"
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "page": page?.encodeToJSON(), 
            "per_page": perPage?.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<[Beer]>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Gets a random beer from the API, this takes no paramaters.
     
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func beersRandomGet(apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: [Beer]?,_ error: Error?) -> Void)) {
        beersRandomGetWithRequestBuilder().execute(apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Gets a random beer from the API, this takes no paramaters.
     - GET /beers/random
     - returns: RequestBuilder<[Beer]> 
     */
    open class func beersRandomGetWithRequestBuilder() -> RequestBuilder<[Beer]> {
        let path = "/beers/random"
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<[Beer]>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}