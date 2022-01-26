//
//  UserFeedbackView.swift
//  iHog
//
//  Created by Maegan Wilson on 1/26/22.
//

import SwiftUI
import OctoKit

struct UserFeedbackView: View {
    @State private var title: String = ""
    @State private var details: String = ""
    @State private var selectedFeedbackType: FeedbackType = .general

    let config = TokenConfiguration(Secrets.github.rawValue)

    private enum FeedbackType: String {
        case bug
        case feature = "enhancement"
        case general = "question"
    }

    var body: some View {
        Form {
            Section {
                Text("This feedback will be public on the GitHub repo.")
                Text("Your name and contact information will not be recorded unless you put it in the description.")
                    .lineLimit(nil)
            }

            Section {
                TextField("summary", text: $title)
            } header: {
                Text("Short summary")
            }

            Section {
                TextEditor(text: $details)
            } header: {
                Text("Feedback Details")
            }

            Section {
                Picker("Feedback", selection: $selectedFeedbackType) {
                    Text("Issue").tag(FeedbackType.bug)
                    Text("Feature Request").tag(FeedbackType.feature)
                    Text("General").tag(FeedbackType.general)
                }.pickerStyle(.menu)
            } header: {
                Text("Type")
            }

            Section {
                Button {
                    addIssueToGithub()
                } label: {
                    Text("Submit")
                }.foregroundColor(.green)
            }

        }.navigationTitle("Feedback")
    }

    func addIssueToGithub() {
        details = details + "\n\(selectedFeedbackType.rawValue)"
        Octokit(config).postIssue(owner: "maeganwilson",
                                  repository: "iHog4",
                                  title: title,
                                  body: details,
                                  assignee: "maeganwilson",
                                  labels: [selectedFeedbackType.rawValue]) { response in
            switch response {
            case .success(let issue):
                print(issue)
            case .failure:
                print("FAILED")
            }
        }
    }
}

struct UserFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserFeedbackView()
        }
    }
}
