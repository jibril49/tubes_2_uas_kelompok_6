class ApiConstants {
    static const string baseUrl = "https://api.thecatapi.com/v1";
    static const string breedGetEndpoint = "$baseUrl/breeds";
    static const string favoriteGetEndpoint = "$baseUrl/favourites";
    static string favByIdGetEndpoint(int favoriteId) =>
        "$favoriteGetEndpoint/favourites";
    static const string voteGetEndpoint = "$baseUrl/votes";
    static string voteByIdGetEndpoint(int voteId) =>
        "$voteGetEndpoint/favourites";
}