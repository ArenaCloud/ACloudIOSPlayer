Pod::Spec.new do |s|
  s.name                = "arenacloud-broadcast-ios"
  s.version             = "0.9.8"
  s.summary             = "ArenaCloud Broadcast iOS SDK"
  s.description      = <<-DESC
                          iOS SDK for Broadcasting using the ArenaCloud API.
                          DESC
  s.homepage            = "https://github.com/ArenaCloud/arenacloud-broadcast-ios"
  s.license             = 'MIT'

  s.authors             = { "Jeffrey Wescott" => "jeffrey@cine.io",
                            "Wang Wenlin" => "sopl.wang@gmail.com" }

  s.source              = { :git => "https://github.com/ArenaCloud/arenacloud-broadcast-ios.git", :tag => s.version.to_s }

  s.requires_arc        = true

  s.header_dir          = 'ArenaCloud/broadcast'

  s.source_files        = [ ‘include/*.h’,
			    ‘include/ijkplayer/*.h’
			    ‘include/videocore/*.h’
			    ‘include/broadcast/*.h’]

  s.frameworks          = [ 'Foundation', 'UIKit', 'QuartzCore', 'CoreGraphics', 'CoreAudio', 'CoreMedia', 'AudioToolbox', 'AVFoundation', 'MediaPlayer' ]
  
  s.libraries		= [‘c++’, ‘z’ ]

  s.dependency          'AFNetworking', '~> 2.5'

  # propagated from VideoCore
  s.xcconfig            = { "HEADER_SEARCH_PATHS" => "${PODS_ROOT}/boost" }

  s.ios.deployment_target = '8.0'

  s.subspec 'include' do |ss|
    ss.source_files        = "include/*.h"
    ss.vendored_library   = [‘libs/ijkplayer/libIJKMediaPlayer.a’,
			     ‘libs/videocore/libVideoCore.a’
			     ‘libs/broadcast/libarenacloud-broadcast-ios.a’
				]
  end
end
