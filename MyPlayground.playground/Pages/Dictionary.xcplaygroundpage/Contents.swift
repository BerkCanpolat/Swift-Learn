//: [Previous](@previous)

import Foundation

var myFavoriteDirectors = [
    "Pulp Fiction" : "Tarantino",
    "Lock Stock" : "Guy Ritchie",
    "The Dark Knight" : "Cristopher Nolan"
]

//Anahtar'ı yani Key'i yazarsak bize value yani değer'ini getirir.
myFavoriteDirectors["Pulp Fiction"]

//Key'i çağırıp eşitleyip değerini değiştirebiliriz
myFavoriteDirectors["Lock Stock"] = "Berk"


//Yeni bir key ve value ekleyerek yeni eleman ekleyebiliriz.
myFavoriteDirectors["Yeni Key"] = "Yeni Eleman"



