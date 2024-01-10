args:
  # import 当前文件夹下所有的 nix 文件，并以 args 为参数执行它们
  # 返回值是一个所有执行结果的列表，也就是 overlays 的列表
  builtins.map
  # map 的第一个参数，是一个 import 并执行 nix 文件的函数
  (f: (import (./. + "/${f}") args))
  # map 的第二个参数，它返回一个当前文件夹下除 default.nix 外所有 nix 文件的列表
  (builtins.filter
    (f: f != "default.nix")
    (builtins.attrNames (builtins.readDir ./.)))
