//
//  Coffee.swift
//  CoffeeMaster
//
//  Created by özgün aksoy on 2023-09-28.
//

import Foundation

struct Coffee: Hashable, Identifiable {
    let id = UUID().uuidString
    let title: String
    let description: String
    let ingredients: [String]
    let imageUrl: String
}

struct ItemCategory: Identifiable {
    let name: String
    let coffees: [Coffee]
    let id = UUID().uuidString
}

struct ProductCategory: Identifiable {
    let name: String
    let coffees: [ItemCategory]
    let categoryImageUrl: String
    let id = UUID().uuidString
}

struct ProductType: Identifiable {
    let name: String
    let categories: [ProductCategory]
    let id = UUID().uuidString
}

extension Coffee {
    static var MOCK_COFFEE = Coffee(
        title: "Caffe Misto",
        description: "A one-to-one mix of fresh brewed coffee and steamed milk, topped with a dollop of foam.",
        ingredients: ["Fresh brewed coffee", "Steamed milk", "Foam"],
        imageUrl: "https://example.com/caffe_misto_image"
    )
    
    static var MOCK_COFFEES = [
        Coffee(
            title: "Caffe Misto",
            description: "A one-to-one mix of fresh brewed coffee and steamed milk, topped with a dollop of foam.",
            ingredients: ["Fresh brewed coffee", "Steamed milk", "Foam"],
            imageUrl: "https://example.com/caffe_misto_image"
        ),
        Coffee(
            title: "Blonde Roast",
            description: "A mellow and soft-blended coffee with a lighter flavor profile and a gentle finish.",
            ingredients: ["Blonde roast coffee beans"],
            imageUrl: "https://example.com/blonde_roast_image"
        ),
        Coffee(
            title: "Pike Place",
            description: "A smooth, well-rounded coffee with a balanced flavor, perfect for any time of day.",
            ingredients: ["Pike Place roast coffee beans"],
            imageUrl: "https://example.com/pike_place_image"
        ),
        Coffee(
            title: "Dark Roast",
            description: "An intense and robust coffee with a bold flavor and a rich, full-bodied taste.",
            ingredients: ["Dark roast coffee beans"],
            imageUrl: "https://example.com/dark_roast_image"
        ),
        Coffee(
            title: "Decaf Pike Place",
            description: "A decaffeinated version of our Pike Place roast, with the same smooth and balanced flavor.",
            ingredients: ["Decaffeinated Pike Place roast coffee beans"],
            imageUrl: "https://example.com/decaf_pike_place_image"
        )
    ]
    
    static let CappuccinoList: [Coffee] = [
        Coffee(title: "Cappuccino", description: "A classic Italian coffee beverage.", ingredients: ["Espresso", "Steamed Milk", "Foamed Milk"], imageUrl: ""),
    ]
    static let EspressoList: [Coffee] = [
    Coffee(title: "Espresso", description: "Strong black coffee made by forcing steam through ground coffee beans.", ingredients: ["Espresso"], imageUrl: ""),
    Coffee(title: "Espresso Con Panna", description: "Espresso topped with whipped cream.", ingredients: ["Espresso", "Whipped Cream"], imageUrl: ""),
    ]

    static let LatteList: [Coffee] = [
        Coffee(title: "Pumpkin Spice Latte", description: "A fall favorite, featuring flavors of pumpkin, cinnamon, nutmeg, and clove.", ingredients: ["Espresso", "Pumpkin Spice Sauce", "Steamed Milk", "Whipped Cream"], imageUrl: ""),
        Coffee(title: "Oleato™ Caffé", description: "A unique blend of coffee.", ingredients: ["Espresso", "Steamed Milk"], imageUrl: ""),
        Coffee(title: "Caffè Latte", description: "A coffee-based drink made primarily from espresso and steamed milk.", ingredients: ["Espresso", "Steamed Milk"], imageUrl: ""),
        Coffee(title: "Cinnamon Dolce Latte", description: "A sweet and spicy coffee beverage.", ingredients: ["Espresso", "Steamed Milk", "Cinnamon Dolce Syrup"], imageUrl: ""),
        Coffee(title: "Starbucks Reserve® Latte", description: "A premium latte from Starbucks Reserve.", ingredients: ["Starbucks Reserve Espresso", "Steamed Milk"], imageUrl: ""),
        Coffee(title: "Starbucks Reserve® Hazelnut Bianco Latte", description: "A rich and creamy latte with a hint of hazelnut.", ingredients: ["Starbucks Reserve Espresso", "Hazelnut Bianco Sauce", "Steamed Milk"], imageUrl: ""),
        Coffee(title: "Starbucks® Blonde Vanilla Latte", description: "A lighter, subtly sweet Starbucks Blonde Espresso with vanilla flavor.", ingredients: ["Starbucks Blonde Espresso", "Vanilla Syrup", "Steamed Milk"], imageUrl: ""),
    ]

    static let MacchiatoList: [Coffee] = [
        Coffee(title: "Apple Crisp Oatmilk Macchiato", description: "A fall-inspired macchiato with flavors of apple and cinnamon.", ingredients: ["Espresso", "Apple Crisp Syrup", "Steamed Oatmilk"], imageUrl: ""),
        Coffee(title: "Caramel Macchiato", description: "A creamy coffee drink with a caramel drizzle.", ingredients: ["Espresso", "Vanilla Syrup", "Steamed Milk", "Caramel Drizzle"], imageUrl: ""),
        Coffee(title: "Espresso Macchiato", description: "A classic espresso drink with a dollop of foam.", ingredients: ["Espresso", "Foamed Milk"], imageUrl: ""),
    ]
    static let MochaList: [Coffee] = [
        Coffee(title: "Caffè Mocha", description: "A chocolate-flavored variant of a caffè latte.", ingredients: ["Espresso", "Mocha Sauce", "Steamed Milk"], imageUrl: ""),
        Coffee(title: "Starbucks Reserve® Dark Chocolate Mocha", description: "A premium mocha experience with dark chocolate flavors.", ingredients: ["Starbucks Reserve Espresso", "Dark Chocolate Sauce", "Steamed Milk"], imageUrl: ""),
        Coffee(title: "White Chocolate Mocha", description: "A caffè latte with additional white chocolate flavoring.", ingredients:["Espresso","White Chocolate Mocha Sauce","Steamed Milk"],imageUrl:"")
    ]

    static let FlatWhiteList: [Coffee] = [
        Coffee(title: "Flat White", description: "A coffee drink consisting of espresso with microfoam.", ingredients: ["Espresso", "Steamed Milk"], imageUrl: ""),
        Coffee(title: "Honey Almondmilk Flat White", description: "Flat white with a sweet twist of honey and almondmilk.", ingredients: ["Espresso", "Steamed Almondmilk", "Honey"], imageUrl: ""),
    ]
}
extension ItemCategory {
    static var MOCK_CATEGORIES: [ItemCategory] = [
        
        
//        Americanos
        ItemCategory(
            name: "Americanos",
            coffees: [Coffee(
                title: "Americano",
                description: "Strong black coffee made by forcing steam through ground coffee beans and water.",
                ingredients: ["Hot Water", "Espresso"],
                imageUrl: "https://example.com/caffe_misto_image"
            )]
        ),
//        Brewed Coffees
        ItemCategory(
            name: "Brewed Coffees",
            coffees: Coffee.MOCK_COFFEES
        ),
//        Cappuccinos
        ItemCategory(
            name: "Cappuccinos",
            coffees: Coffee.CappuccinoList
        ),
//        Espresso Shots
        ItemCategory(
            name: "Espresso Shots",
            coffees: Coffee.EspressoList
        ),
//        Flat Whites
        ItemCategory(
            name: "Flat Whites",
            coffees: Coffee.FlatWhiteList
        ),
//        Lattes
        ItemCategory(
            name: "Lattes",
            coffees: Coffee.LatteList
        ),
//        Macchiatos
        ItemCategory(
            name: "Macchiatos",
            coffees: Coffee.MacchiatoList
        ),
//        Mochas
        ItemCategory(
            name: "Mochas",
            coffees: Coffee.MochaList
        ),
    ]
}

extension ProductCategory {
    static var MOCK_PRODUCT_CATEGORIES: [ProductCategory] = [
        ProductCategory(
            name: "Hot Coffees",
            coffees: ItemCategory.MOCK_CATEGORIES,
            categoryImageUrl: "https://example.com/drinks_image"
        ),
        ProductCategory(
            name: "Hot Teas",
            coffees: ItemCategory.MOCK_CATEGORIES,
            categoryImageUrl: "https://example.com/food_image"
        ),
        ProductCategory(
            name: "Hot Drinks",
            coffees: ItemCategory.MOCK_CATEGORIES,
            categoryImageUrl: "https://example.com/drinks_image"
        ),
        ProductCategory(
            name: "Frappuccino",
            coffees: ItemCategory.MOCK_CATEGORIES,
            categoryImageUrl: "https://example.com/food_image"
        ),
        ProductCategory(
            name: "Cold Coffees",
            coffees: ItemCategory.MOCK_CATEGORIES,
            categoryImageUrl: "https://example.com/drinks_image"
        ),
        ProductCategory(
            name: "Iced Teas",
            coffees: ItemCategory.MOCK_CATEGORIES,
            categoryImageUrl: "https://example.com/food_image"
        ),
        ProductCategory(
            name: "Cold Drinks",
            coffees: ItemCategory.MOCK_CATEGORIES,
            categoryImageUrl: "https://example.com/drinks_image"
        ),
    ]
}

extension ProductType {
    static var MOCK_PRODUCT_TYPES: [ProductType] = [
        ProductType(
            name: "Drinks",
            categories: ProductCategory.MOCK_PRODUCT_CATEGORIES
        ),
        ProductType(
            name: "Food",
            categories: ProductCategory.MOCK_PRODUCT_CATEGORIES
        ),
        ProductType(
            name: "At Home",
            categories: ProductCategory.MOCK_PRODUCT_CATEGORIES
        ),
        ProductType(
            name: "Merchandise",
            categories: ProductCategory.MOCK_PRODUCT_CATEGORIES
        )
        
    ]
}




//extension ItemCategory {
//    static var MOCK_CATEGORY = CoffeeCategory(name: "Brewed Coffeess", coffees: [Coffee(name: "Caffe Misto"),
//                                                                                 Coffee(name: "Blonde Roast"),
//                                                                                 Coffee(name: "Pike Place"),
//                                                                                 Coffee(name: "Dark Roast"),
//                                                                                 Coffee(name: "Decaf Pike Place")])
//    
//    static var MOCK_CATEGORIES = [CoffeeCategory(name: "Americanos", coffees: [Coffee(name: "Americano"),
//                                                                               Coffee(name: "Brown Sugar Oat Americano"),
//                                                                               Coffee(name: "Americano Misto")]),
//                                  CoffeeCategory(name: "Brewed Coffeess", coffees: [Coffee(name: "Caffe Misto"),
//                                                                                    Coffee(name: "Blonde Roast"),
//                                                                                    Coffee(name: "Pike Place"),
//                                                                                    Coffee(name: "Dark Roast"),
//                                                                                    Coffee(name: "Decaf Pike Place")]),
//                                  CoffeeCategory(name: "Espresso Shots", coffees: [Coffee(name: "Espresso"),
//                                                                                   Coffee(name: "Espresso Con Panna")]),
//                                  CoffeeCategory(name: "Flat Whites", coffees: [Coffee(name: "Flat White"),
//                                                                                Coffee(name: "Honey Almondmilk Flat White")])]
//}


