{:user {:plugins [[lein-kibit "0.1.2"]
                  [lein-ancient "0.6.7"]
                  [lein-environ "1.0.0"]
                  [lein-vanity "0.2.0"]
                  [codox "0.9.0"]
                  [lein-exec "0.3.5"]
                  [quickie "0.4.1"]
                  [test2junit "1.1.2"]]
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
 :repl {:plugins [[refactor-nrepl "2.0.0-SNAPSHOT"]
                  [cider/cider-nrepl "0.10.0"]]
        :dependencies [[org.clojure/tools.nrepl "0.2.12"]]}}
