# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Budget' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Budget
  pod 'SwiftLint'

  script_phase :name => '🧹 SwiftLint',
  :script => '$PODS_ROOT/SwiftLint/swiftlint lint',
  :execution_position => :before_compile
end
