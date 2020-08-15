# pushAnotherRepo

## Usage

please insert the folloring code in your workflow file.
```yaml
jobs:
  remote-upload:
    name: Upload a file to Another Repository
    runs-on: ubuntu-latest
    steps:
      - name: Set up Git repository
        uses: actions/checkout@v2
        
      - name: Push a file to another repository
        uses: huyu-no-yozora/pushAnotherRepo@master
        with:
          deploy-token: ${{ secrets.GH_DEPLOY_TOKEN }}
          upload-file: <upload file name>
          destination-username: <owner>
          destination-repository: <destination repository>
          user-email: <your email address>
          target-directory: <target directory path under the root directory of destination repository>
```

## License
This code is licensed by [MIT](LICENSE).


