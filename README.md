# Docker Network 101

## Via Docker Compose

```sh
docker-compose up
```

```sh
docker-compose up -d
```

```sh
docker-compose down
```

```sh
docker-compose up --build --force-recreate
```

## Install get-junit-report
```sh
    go get -u github.com/jstemmer/go-junit-report
```

## steps

- Run unit test & report

    ```sh
        # cd helloworld
        go mod download
        go test -v 2>&1 | go-junit-report > report.xml
    ```
- Build package(Image)
- Start appilication

    ```sh
        # cd ..
        docker-compose up -d --build --force-recreate
    ```

- Run API test

    ```sh
        # cd test/api
        python3 -m venv env
        source env/bin/activate
        pip install -r requirements.txt
        robot greeting.robot
        deactivate
    ```