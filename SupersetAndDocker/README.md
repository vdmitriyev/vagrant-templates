## About

Installing and starting [Apache Superset](https://github.com/apache/incubator-superset) for BI. In this case special plugin for the docker compose is used - https://github.com/leighmcculloch/vagrant-docker-compose.

## Software+vagrant specific

* This software worsk with symlinks intensively. And in case of the shared folder under vagrant, it produces conflict with native sync from vagrant (example - https://github.com/yarnpkg/yarn/issues/4908). To solve this issue, don't put your files into /vagrant or /home/vagrant folders (it's already considered in provision).

## Dependencies

* ```vagrant plugin install vagrant-docker-compose```

## Different

* Run following command inside vagrant machine after start ```docker-compose up```


## Access

* http://localhost:8088/
    - admin/admin
