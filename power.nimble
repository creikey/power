# Package

version       = "0.1.0"
author        = "Cameron Reikes"
description   = "Easy to use library for cross platform nim game development using sokol libraries"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 1.6.6"
requires "https://github.com/floooh/sokol-nim#ceef61463e9fe15336a2a31056d36ca2e9b221d2"

import strformat

proc compilerSwitch(): string =
  when defined(windows):
    return "--cc:vcc"
  else:
    return ""

proc backendSwitch(): string =
  when defined gl:
    return "-d:gl"
  else:
    return ""

proc run(name: string) =
  exec &"nim r {compilerSwitch()} {backendSwitch()} examples/{name}"

task triangle, "Runs triangle":
    run "triangle"