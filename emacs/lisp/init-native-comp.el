;;; init-native-comp.el --- For native-comp settings.  -*- lexical-binding: t; -*-

;;; Commentary:
;;; Code:

(when (and (featurep 'native-compile) (native-comp-available-p))
  (setq native-comp-async-jobs-number 8))

(provide 'init-native-comp)
;;; Local Variables:
;;; coding: utf-8
;;; End:
;;; init-native-comp.el ends here
