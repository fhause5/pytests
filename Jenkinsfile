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
        try {
            sh '''
                cd pytests
                docker build -t autotests:1 .
                docker run --rm autotests:1
            '''.stripIndent()
        } catch (Exception ex) {
            println("[WARNING]")
        }
    }
    stage('Generate Allure report') {
        sh '''
            cd pytests
            docker run --rm frankescobar/allure-docker-service:latest allure generate -c ./allure-results -o allure-report/
        '''.stripIndent()
    }
}