//
//  PatternStudyTests.swift
//  PatternStudyTests
//
//  Created by 이재훈 on 2023/04/24.
//

import XCTest
@testable import PatternStudy
// 기존 프로젝트의 코드에 접근할 수 있게 해주는 코드
var sut: TestViewController!
// SUT( System Under Test ) 또는 이 테스트 케이스 클래스가 테스트와 관련된 개체인 에 대한 자리 표시자가 생성

final class PatternStudyTests: XCTestCase {

    override func setUpWithError() throws {
        // 테스트 메소드가 실행되기 전 모든 상태를 reset 합니다. (초기화 코드)
        try super.setUpWithError()
        sut = TestViewController()
    }

    override func tearDownWithError() throws {
        // 테스트 동작이 끝난 후 모든 상태를 clean up 합니다. (해체 코드)
        sut = nil
        try super.tearDownWithError()
    }
    
    // 테스트 메소드는 반드시 test 키워드로 시작
    func testScoreComputedWhenGuessIsHigherThanTarget() {
        // 테스트 포맷은 given-when-then 구조로 작성하는 것이 좋음
        
        //given (필요한 value들을 세팅)
        let guess = sut.number
        
        // when (테스트 코드 실행)
        sut.check(num: guess + 5)
        
        // then (결과확인)
        XCTAssertEqual(sut.spinRound(sut.number), sut.spinRound(guess), "Score computed from guess is Wrong")
    }
}
