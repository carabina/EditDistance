//
//  EditDistanceProtocol.swift
//  EditDistance
//
//  Copyright (c) 2017 Kazuhiro Hayashi
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
import Foundation


/// protocol that concrete classes follow it to calculate edit distance.
public protocol EditDistanceAlgorithm {
    associatedtype Element: Comparable
    
    func calculate(from: [[Element]], to: [[Element]]) -> EditDistanceContainer<Element>
}


/// Type-erased EditDistanceAlgorithm to implement an instant algorithm.
public struct AnyEditDistanceAlgorithm<T>: EditDistanceAlgorithm where T: Comparable {

    public func calculate(from: [[T]], to: [[T]]) -> EditDistanceContainer<T> {
        return _calc(from, to)
    }

    public typealias Element = T
    private let _calc: ([[T]], [[T]]) -> EditDistanceContainer<T>
    
    public init(_ calc: @escaping ([[T]], [[T]]) -> EditDistanceContainer<T>) {
        _calc = calc
    }
}
