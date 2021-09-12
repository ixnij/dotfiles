(when (and (featurep 'native-compile) (native-comp-available-p))
  (setq native-comp-async-jobs-number 4))

(provide 'init-native-comp)
