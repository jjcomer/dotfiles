{:user {:plugins [[lein-kibit "0.0.8"]
                  [lein-ancient "0.6.6"]
                  [jonase/eastwood "0.2.1"]
                  [lein-environ "1.0.0"]
                  [refactor-nrepl "1.0.4-SNAPSHOT"]
                  [codox "0.8.11"]
                  [cider/cider-nrepl "0.9.0-SNAPSHOT"]
                  [lein-exec "0.3.4"]
                  [quickie "0.3.9"]
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
                  "sancient" ^{:doc "Check all deps including snapshots"}
                  ["ancient" ":allow-all"]}}}
