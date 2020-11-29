node('jenkins-slave') {
    stage('Clone') {
        sh '''
            rm -rf pytests/
            git clone https://github.com/fhause5/pytests.git
            cd pytests
            mkdir allure-results/
            mkdir allure-report/
        '''.stripIndent()
    }
    stage('Run Pytest') {
        sh '''
            docker build -t autotests:1 .
            docker run --rm autotests:1
        '''.stripIndent()
    }
    stage('Generate Allure report') {
        sh '''
            docker run --rm frankescobar/allure-docker-service:latest allure generate -c ./allure-results -o allure-report/
        '''.stripIndent()
    }
}