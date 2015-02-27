{:user {:plugins [[lein-kibit "0.0.8"]
                  [lein-ancient "0.6.2"]
                  [jonase/eastwood "0.2.1"]
                  [lein-environ "1.0.0"]
                  [refactor-nrepl "0.3.0-SNAPSHOT"]
                  [codox "0.8.10"]
                  [cider/cider-nrepl "0.9.0-SNAPSHOT"]
                  [lein-exec "0.3.4"]
                  [test2junit "1.1.0"]]
        :dependencies [[org.clojure/tools.nrepl "0.2.7"]]
        :aliases {"ccheck" ^{:doc "Clean and check the source"}
                  ["do" ["clean"] ["check"]]
                  "cinstall" ^{:doc "Clean and install locally"}
                  ["do" ["clean"] ["install"]]
                  "sancient" ^{:doc "Check all deps including snapshots"}
                  ["ancient" ":allow-all"]}}}
