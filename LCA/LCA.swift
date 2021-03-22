//
//  LCA.swift
//  LCA
//
//  Created by Uji Saori on 2021-03-22.
//

import Foundation

func nodeLCA() {
    let n = Int(readLine()!)!
    var tree = [[Int]](repeating: [Int](), count: n + 1)    // skip index 0 to make readable
    
    for _ in 0 ..< n - 1 {
        let nodes = readLine()!.split(separator: " ").map { String($0) }
        tree[Int(nodes[0])!].append(Int(nodes[1])!)
        tree[Int(nodes[1])!].append(Int(nodes[0])!)
    }
    
//    print("===== Each Node =====")
//    for i in 1 ... n {
//        print("<\(i)> \(tree[i])")
//    }
    
    print("===== LCA =====")
    let m = Int(readLine()!)!
    for _ in 0 ..< m {
        let nodes = readLine()!.split(separator: " ").map { String($0) }
        let nodeA = Int(nodes[0])!
        let nodeB = Int(nodes[1])!
        getLCA(tree: tree, nodeA: nodeA, nodeB: nodeB)
    }
}

func getLCA(tree: [[Int]], nodeA: Int, nodeB: Int) {
    var parentNodeA = 1
    var parentNodeB = 1
    if nodeA != 1 {
        parentNodeA = tree[nodeA][0]
    }
    if nodeB != 1 {
        parentNodeB = tree[nodeB][0]
    }
    if parentNodeA == parentNodeB {
//        print("LCA of \(nodeA) and \(nodeB) is: \(parentNodeA)")
        print(parentNodeA)
    } else if nodeA == parentNodeB {
//        print("LCA of \(nodeA) and \(nodeB) is: \(parentNodeB)")
        print(parentNodeB)
    } else if nodeB == parentNodeA {
//        print("LCA of \(nodeA) and \(nodeB) is: \(parentNodeA)")
        print(parentNodeA)
    } else {
        getLCA(tree: tree, nodeA: tree[nodeA][0], nodeB: tree[nodeB][0])
    }
}
