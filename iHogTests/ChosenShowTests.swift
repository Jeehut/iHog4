//
//  ChosenShowTests.swift
//  iHogTests
//
//  Created by Maegan Wilson on 6/9/21.
//

import XCTest
@testable import iHog

class ChosenShowTests: XCTestCase {
    var sut: ChosenShow!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ChosenShow(showID: UUID())
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func test_ChosenShowInit_ShouldHaveNoObjects() {
        let listCount = sut.lists.count
        let sceneCount = sut.scenes.count
        let groupCount = sut.groups.count
        let paletteCount = sut.palettes.count
        
        XCTAssertEqual(listCount, 0, "List count check")
        XCTAssertEqual(sceneCount, 0, "scene count check")
        XCTAssertEqual(groupCount, 0, "Group count check")
        XCTAssertEqual(paletteCount, 0, "Palette count check")
    }
    
    // MARK: Testing Scenes
    func test_ChosenShowAddScene_ShouldHave1Scene() {
        let testScene = ShowObject(objType: .scene,
                                   number: 1,
                                   objColor: "red")
        
        sut.addScene(testScene)
        XCTAssertEqual(sut.scenes, [testScene])
    }
    
    func test_ChosenShowAddScenes_ShouldHave10Scenes() {
        
        for n in 1...500 {
            let tempScene = ShowObject(objType: .scene,
                                       number: Double(n),
                                       objColor: "red")
            sut.addScene(tempScene)
        }
        
        XCTAssertEqual(sut.scenes.count, 500)
    }
    
    func test_ChosenShowUpdateSceneName_ShouldHaveOut(){
        let SAMPLE_SCENE = ShowObject(objType: .scene,
                                      number: 1,
                                      objColor: "red")
        sut.addScene(SAMPLE_SCENE)
        
        var updatedScene = SAMPLE_SCENE
        updatedScene.setName("Out")
        
        sut.updateScene(updatedScene)
        XCTAssertEqual(sut.scenes[0].getName(), "Out")
    }
    
    func test_ChosenShowUpdateSceneName_ShouldHaveOutAt10Scene(){
        for n in 1...500 {
            let tempScene = ShowObject(objType: .scene,
                                       number: Double(n),
                                       objColor: "red")
            sut.addScene(tempScene)
        }
        
        var updatedScene = sut.scenes[10]
        updatedScene.setName("Out")
        
        sut.updateScene(updatedScene)
        XCTAssertEqual(sut.scenes[10].getName(), "Out")
    }
    
    func test_RemoveScene_ShouldHave0Scenes(){
        let SAMPLE_SCENE = ShowObject(objType: .scene,
                                      number: 1,
                                      objColor: "red")
        sut.addScene(SAMPLE_SCENE)
        sut.removeScene(SAMPLE_SCENE)
        XCTAssert(sut.scenes.count == 0)
    }
    
    func test_RemoveScene_ShouldHave499Scenes(){
        for n in 1...500 {
            let tempScene = ShowObject(objType: .scene,
                                       number: Double(n),
                                       objColor: "red")
            sut.addScene(tempScene)
        }
        
        let removedScene = sut.scenes[10]
        
        sut.removeScene(removedScene)
        XCTAssertFalse(sut.scenes[10] == removedScene)
    }
    
    // MARK: Testing Lists
    func test_ChosenShowAddList_ShouldHave1List() {
        let testList = ShowObject(objType: .list,
                                   number: 1,
                                   objColor: "red")
        
        sut.addList(testList)
        XCTAssertEqual(sut.lists, [testList])
    }
    
    func test_ChosenShowAddLists_ShouldHave10Lists() {
        
        for n in 1...500 {
            let tempList = ShowObject(objType: .list,
                                       number: Double(n),
                                       objColor: "red")
            sut.addList(tempList)
        }
        
        XCTAssertEqual(sut.lists.count, 500)
    }
    
    func test_ChosenShowUpdateListName_ShouldHaveOut(){
        let SAMPLE_TEST = ShowObject(objType: .list,
                                      number: 1,
                                      objColor: "red")
        sut.addList(SAMPLE_TEST)
        
        var updatedList = SAMPLE_TEST
        updatedList.setName("Out")
        
        sut.updateList(updatedList)
        XCTAssertEqual(sut.lists[0].getName(), "Out")
    }
    
    func test_ChosenShowUpdateListName_ShouldHaveOutAt10Scene(){
        for n in 1...500 {
            let tempList = ShowObject(objType: .list,
                                       number: Double(n),
                                       objColor: "red")
            sut.addList(tempList)
        }
        
        var updatedLists = sut.lists[10]
        updatedLists.setName("Out")
        
        sut.updateList(updatedLists)
        XCTAssertEqual(sut.lists[10].getName(), "Out")
    }
    
    func test_RemoveList_ShouldHave0Lists(){
        let SAMPLE_LIST = ShowObject(objType: .list,
                                      number: 1,
                                      objColor: "red")
        sut.addList(SAMPLE_LIST)
        sut.removeList(SAMPLE_LIST)
        XCTAssert(sut.lists.count == 0)
    }
    
    func test_RemoveList_ShouldHave499Lists(){
        for n in 1...500 {
            let tempList = ShowObject(objType: .list,
                                       number: Double(n),
                                       objColor: "red")
            sut.addList(tempList)
        }
        
        let removedList = sut.lists[10]
        
        sut.removeList(removedList)
        XCTAssertFalse(sut.lists[10] == removedList)
    }
}
