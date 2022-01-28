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
    @State private var details: String = "Include any additional information here."
    @State private var selectedFeedbackType: FeedbackType = .feature
    @State private var buttonState: ButtonState = .neutral

    var body: some View {
        Form {
            Section {
                TextField("Summary", text: $title)
            } header: {
                Text("Short summary")
            }

            Section {
                Picker("Feedback", selection: $selectedFeedbackType) {
                    Text("Issue").tag(FeedbackType.bug)
                    Text("Feature Request").tag(FeedbackType.feature)
                }.pickerStyle(.menu)
            } header: {
                Text("Type")
            }

            Section {
                TextEditor(text: $details)
                    .frame(height: 100.0)
            } header: {
                Text("Feedback Details")
            }

            /// MARK: Submit Button
            HStack {
                Button {
                    addIssueToGithub()
                } label: {
                    switch buttonState {
                    case .neutral:
                        Text("\(Image(systemName: "paperplane")) Submit")
                    case .error:
                        Text("There is an error submitting the feedback. Please email it to maegan@maeganwilson.com")
                    case .sending:
                        Text("\(Image(systemName: "paperplane.fill")) Sending")
                    case .sent:
                        Text("\(Image(systemName: "checkmark")) Submitted")
                    }
                }.foregroundColor(.green)
            }
            .listRowBackground(Color.clear)
            .listRowInsets(.init())
            .border(.clear, width: 0)
        }.navigationTitle("Feedback")
    }

    private enum ButtonState {
        case neutral
        case error
        case sending
        case sent
    }

    private enum FeedbackType: String {
        case bug
        case feature = "enhancement"
    }

    let config = TokenConfiguration(Secrets.github.rawValue)

    let appVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "2022"
    let appBuild: String = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"

    private func addIssueToGithub() {
        buttonState = .sending
        let device = UIDevice()
        var issueBody = "| Auto Gen | Information |\n"
        issueBody += "|---|---|\n"
        issueBody += "| Date | \(Date.now) |\n"
        issueBody += "|App Version| \(appVersion) \(appBuild)|\n"
        issueBody += "|OS Version| \(device.systemVersion)|\n"
        issueBody += "|Device Model| \(device.model)|\n"
        issueBody += "\n" + details + "\n"

        Octokit(config).postIssue(owner: "maeganwilson",
                                  repository: "ihogissues",
                                  title: title,
                                  body: issueBody,
                                  assignee: "maeganwilson",
                                  labels: [selectedFeedbackType.rawValue]) { response in
            switch response {
            case .success:
                buttonState = .sent
            case .failure:
                print("FAILED")
                buttonState = .error
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
