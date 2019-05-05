Pod::Spec.new do |s|
    s.name             = 'AirgappedSigning'
    s.version          = '0.2.0'
    s.summary          = 'A protocol for transmission of messages between hot and cold cryptographic wallets.'

    # s.description      = <<-DESC
    # TODO: Add long description of the pod here.
    # DESC

    s.homepage         = 'https://github.com/blockchaincommons/AirgappedSigning'
    s.license          = { :type => 'Apache', :file => 'LICENSE' }
    s.author           = { 'Wolf McNally' => 'wolf@wolfmcnally.com' }
    s.source           = { :git => 'https://github.com/blockchainCommons/AirgappedSigning.git', :tag => s.version.to_s }

    s.source_files = 'Sources/AirgappedSigning/**/*'

    s.swift_version = '5.0'

    s.ios.deployment_target = '11.0'
    # s.macos.deployment_target = '10.13'
    # s.tvos.deployment_target = '11.0'

    s.module_name = 'AirgappedSigning'

    s.dependency 'Bitcoin'
    s.dependency 'WolfCore'
end
