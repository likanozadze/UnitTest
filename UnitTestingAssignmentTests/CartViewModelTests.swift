//
//  CartViewModelTests.swift
//  UnitTestingAssignmentTests
//
//  Created by Lika Nozadze on 12/3/23.
//

import XCTest

@testable import UnitTestingAssignment

final class CartViewModelTests: XCTestCase {
    
    var cartViewModel: CartViewModel!
    
    override func setUpWithError()  throws {
        cartViewModel = CartViewModel()
    }
    
    override func tearDownWithError() throws {
        cartViewModel = nil
    }
    
    func testAddProductWithID() {
        
        let product1 = Product(id: 1, title: "Test Product 1", description: "This is a test product", price: 10.0, selectedQuantity: 1)
        let product2 = Product(id: 2, title: "Test Product 2", description: "This is a test product", price: 20.0, selectedQuantity: 2)
        cartViewModel.allproducts = [product1, product2]
        
        cartViewModel.addProduct(withID: 1)
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        XCTAssertEqual(cartViewModel.selectedProducts.first?.id, product1.id)
        XCTAssertEqual(cartViewModel.selectedProducts.first?.selectedQuantity, product1.selectedQuantity)
    }
    
    func testAddNonExistentProductWithID() {
        
        let product1 = Product(id: 1, title: "Test Product 1", description: "This is a test product", price: 10.0, selectedQuantity: 1)
        let product2 = Product(id: 2, title: "Test Product 2", description: "This is a test product", price: 20.0, selectedQuantity: 2)
        cartViewModel.allproducts = [product1, product2]
        
        cartViewModel.addProduct(withID: 40)
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 0)
    }
    
    func testAddProduct() {
        
        let product = Product(id: 1, title: "Test Product", description: "This is a test product", price: 10.0, selectedQuantity: 1)
        
        cartViewModel.addProduct(product: product)
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        XCTAssertEqual(cartViewModel.selectedProducts.first?.id, product.id)
        XCTAssertEqual(cartViewModel.selectedProducts.first?.selectedQuantity, product.selectedQuantity)
    }
    
    func testAddExistingProduct() {
        
        let product = Product(id: 1, title: "Test Product", description: "This is a test product", price: 10.0, selectedQuantity: 1)
        cartViewModel.addProduct(product: product)
        
        cartViewModel.addProduct(product: product)
        
        XCTAssertEqual(cartViewModel.selectedProducts.first?.selectedQuantity, 2)
    }
    
    
    func testAddRandomProduct() {
        
        let product1 = Product(id: 1, title: "Test Product 1", description: "This is a test product", price: 10.0, selectedQuantity: 1)
        let product2 = Product(id: 2, title: "Test Product 2", description: "This is a test product", price: 20.0, selectedQuantity: 2)
        cartViewModel.allproducts = [product1, product2]
        
        cartViewModel.addRandomProduct()
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
    }
    
    func testRemoveProduct() {
        
        let product1 = Product(id: 1, title: "Test Product 1", description: "This is a test product", price: 10.0, selectedQuantity: 1)
        let product2 = Product(id: 2, title: "Test Product 2", description: "This is a test product", price: 20.0, selectedQuantity: 2)
        cartViewModel.selectedProducts = [product1, product2]
        
        cartViewModel.removeProduct(withID: 1)
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
        XCTAssertNil(cartViewModel.selectedProducts.first(where: { $0.id == 1 }))
    }
    
    func testClearCart() {
        
        let product1 = Product(id: 1, title: "Product 1", description: "This is product 1", price: 10.0, selectedQuantity: 2)
        let product2 = Product(id: 2, title: "Product 2", description: "This is product 2", price: 20.0, selectedQuantity: 3)
        
        cartViewModel.addProduct(product: product1)
        cartViewModel.addProduct(product: product2)
        
        cartViewModel.clearCart()
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 0)
    }
    
    func testRemoveNonExistentProduct() {
        let product1 = Product(id: 1, title: "Test Product 1", description: "This is a test product", price: 10.0, selectedQuantity: 1)
        let product2 = Product(id: 2, title: "Test Product 2", description: "This is a test product", price: 20.0, selectedQuantity: 2)
        cartViewModel.selectedProducts = [product1, product2]
        
        cartViewModel.removeProduct(withID: 40)
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 2)
    }
    
}
