//
//  ScoreView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 29.01.2023.
//

import SwiftUI

struct ScoreView: View{
    let score: Double
    var body: some View{
        HStack(spacing: 1){
            Image(systemName: self.score < 1  ? "wrench.adjustable" : "wrench.adjustable.fill")
            Image(systemName: self.score < 2  ? "wrench.adjustable" : "wrench.adjustable.fill")
            Image(systemName: self.score < 3  ? "wrench.adjustable" : "wrench.adjustable.fill")
            Image(systemName: self.score < 4  ? "wrench.adjustable" : "wrench.adjustable.fill")
            Image(systemName: self.score < 5  ? "wrench.adjustable" : "wrench.adjustable.fill")
        }
        .font(.footnote)
        .foregroundColor(.accentColor)
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 5)
    }
}
