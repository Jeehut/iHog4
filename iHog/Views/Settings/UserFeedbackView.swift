//
//  UserFeedbackView.swift
//  iHog
//
//  Created by Maegan Wilson on 1/26/22.
//

import SwiftUI
import OctoKit

struct UserFeedbackView: View {
    @Environment(\.dismiss) private var dismiss

    @EnvironmentObject var toast: ToastNotification

    @Binding var selection: SettingsNav?
    @Binding var issueSubmitted: Bool?

    @State private var title: String = ""
    @State private var details: String = "Include any additional information here."
    @State private var selectedFeedbackType: FeedbackType = .feature
    @State private var buttonState: ButtonState = .neutral
    @State private var errorText = ""

    var body: some View {
        Form {
            Section {
                TextField("Summary", text: $title)
            } header: {
                Text("Short summary")
            }

            Section {
                Picker("Feedback", selection: $selectedFeedbackType) {
                    Text("Bug").tag(FeedbackType.bug)
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
            VStack {
                Button(action: addIssueToGithub) {
                    switch buttonState {
                    case .neutral:
                        Text("\(Image(systemName: "paperplane")) Submit")
                            .frame(width: 200.0, height: 50.0)
                            .background(Color.blue)
                    case .error:
                        Text("\(Image(systemName: "paperplane")) Submit")
                            .frame(width: 200.0, height: 50.0)
                            .background((title.count == 0) ? Color.red : Color.blue)
                    case .sending:
                        Text("\(Image(systemName: "paperplane.fill")) Sending")
                            .frame(width: 200.0, height: 50.0)
                            .background(Color.gray)
                    case .sent:
                        Text("\(Image(systemName: "checkmark")) Submitted")
                            .frame(width: 200.0, height: 50.0)
                            .background(Color.green)
                    }
                }
                .animation(.easeInOut, value: buttonState)
                .animation(.easeInOut, value: title)
                .foregroundColor(Color.white)
                .cornerRadius(10.0)

                Text(errorText)
                    .foregroundColor(.red)
            }.frame(maxWidth: .infinity)
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

    let config = TokenConfiguration(ProcessInfo.processInfo.environment["GitHubAPI"])

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
                toast.animateIn(text: "Feedback submitted", color: Color.green)
                selection = nil
            case .failure(let error):
                print(error)
                errorText = "No summary given."
                buttonState = .error
                toast.animateIn(text: "No summary given", color: .red)
            }
        }
    }
}

struct UserFeedbackView_Previews: PreviewProvider {
    @State static var settings: SettingsNav? = SettingsNav.userFeedbackView
    static var previews: some View {
        NavigationView {
            UserFeedbackView(selection: $settings,
                             issueSubmitted: Binding.constant(false))
        }
    }
}
