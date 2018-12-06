{:user {:plugins [[lein-kibit "0.1.6"]
                  [lein-ancient "0.6.15"]
                  [lein-environ "1.0.3"]
                  [lein-vanity "0.2.0"]
                  [codox "0.9.5"]
                  [lein-exec "0.3.6"]
                  [quickie "0.4.2"]
                  [test2junit "1.2.2"]
                  [lein-pprint "1.1.2"]]
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
