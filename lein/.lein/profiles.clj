{:user {:plugins [[lein-kibit "0.1.2"]
                  [lein-ancient "0.6.7"]
                  [lein-environ "1.0.0"]
                  [refactor-nrepl "1.2.0-SNAPSHOT"]
                  [codox "0.8.12"]
                  [cider/cider-nrepl "0.10.0-SNAPSHOT"]
                  [lein-exec "0.3.4"]
                  [quickie "0.3.11"]
                  [test2junit "1.1.0"]]
        :dependencies [[org.clojure/tools.nrepl "0.2.10"]]
        :aliases {"ccheck" ^{:doc "Clean and check the source"}
                  ["do" ["clean"] ["check"]]
                  "cinstall" ^{:doc "Clean and install locally"}
                  ["do" ["clean"] ["install"]]
                  "start" ^{:doc "Trampoline run"}
                  ["trampoline" "run"]
                  "cstart" ^{:doc "Clean and start"}
                  ["do" ["clean"] ["start"]]
                  "ttest" ^{:doc "Run tests in test profile"}
                  ["with-profile" "test" "test"]
                  "sancient" ^{:doc "Check all deps including snapshots"}
                  ["ancient" ":allow-all"]}}}
