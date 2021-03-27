

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'gsesuite.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'gsesuite.UserRole'
grails.plugin.springsecurity.authority.className = 'gsesuite.Role'
grails.plugin.springsecurity.securityConfigType = "Annotation"
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
    [pattern: '/',               access: ['permitAll']],
    [pattern: '/inputParam/main',access: ['permitAll']],
    [pattern: '/inputParam/chipInput',access: ['permitAll']],
	[pattern: '/inputParam/peakToGene',access: ['permitAll']],
	[pattern: '/inputParam/reverseQuery',access: ['permitAll']],
	[pattern: '/inputParam/peakToGeneOld',access: ['permitAll']],
	[pattern: '/inputParam/news',access: ['permitAll']],
	[pattern: '/inputParam/showConcept',access: ['permitAll']],
	[pattern: '/inputParam/subJob',access: ['permitAll']],
	[pattern: '/inputParam/peakgeneresult',access: ['permitAll']],
	[pattern: '/inputParam/connectdatabase',access: ['permitAll']],
	[pattern: '/inputParam/peakToGeneStatus',access: ['permitAll']],
	[pattern: '/inputParam/peaktogeneerror',access: ['permitAll']],
	[pattern: '/inputParam/peakpergeneresult',access: ['permitAll']],
	[pattern: '/inputParam/peaksresults',access: ['permitAll']],
	[pattern: '/inputParam/downloadFile',access: ['permitAll']],
	[pattern: '/conceptInfo/*',access: ['permitAll']],
	[pattern: '/peakfilemapping/*',access: ['permitAll']],
	[pattern: '/inputParam/checksuerlogin',access: ['permitAll']],
	[pattern: '/inputParam/saveReview',access: ['permitAll']],
	[pattern: '/user/save',access: ['permitAll']],
	[pattern: '/Users/snehalpatil/Documents/GithubProjects/**',access: ['permitAll']],
	[pattern: '/inputParam/contact',access: ['permitAll']],
	[pattern: '/inputParam/sendemail',access: ['permitAll']],
	[pattern: '/inputParam/tutorials',access: ['permitAll']],
	[pattern: '/resources/demos/*',access: ['permitAll']],
    [pattern: '/user/create',access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/fonts/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']]
//	[pattern: '/user/**', access: 'ROLE_USER'],
//	[pattern: '/admin/**', access: ['ROLE_ADMIN','isFullyAuthenticated()']],
	//[pattern: '/inputParam/chipInput/', access: 'isAuthenticated()',httpMethod: 'PUT']

]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
    [pattern: '/**', filters: 'JOINED_FILTERS']

]
