{:user {:plugins [[lein-kibit "0.1.2"]
                  [lein-ancient "0.6.8"]
                  [lein-environ "1.0.2"]
                  [lein-vanity "0.2.0"]
                  [codox "0.9.4"]
                  [lein-exec "0.3.6"]
                  [quickie "0.4.1"]
                  [test2junit "1.2.1"]
                  [lein-pprint "1.1.1"]]
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
                  ["ancient" ":allow-all"]}}
 :repl {:plugins [[refactor-nrepl "2.2.0-SNAPSHOT"]]}}
