import { makeStyles } from "@mui/styles"
import { Container, Grid, Typography } from "@mui/material";

const useStyles = makeStyles((theme: Theme) => ({
	skillComponent: {
		borderTop: `1px solid ${ theme.palette.divider }`,
		marginTop: 20,
	},
	skillsTitle: {
		textAlign: 'center',
		marginBottom: 50,
		marginTop: 50,
		'& > h6': {
			fontWeight: 600,
		},
	},
	skillContainer: {
		'& img': {
			width: 50,
			height: 50,
		}
	},
}))

export function Skills() {
	const cls = useStyles();

	return (
		<Container maxWidth='md' className={ cls.skillComponent }>
			<Container className={ cls.skillsTitle } maxWidth='md'>
				<Typography variant="h6">
					$Techs I know
				</Typography>
			</Container>
			<Container>
				<Grid container justifyContent='center' spacing={3} className={ cls.skillContainer }>
					<Grid item>
						<img alt='linux' src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg" />
					</Grid>
					<Grid item>
						<img alt='bash' src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/bash/bash-original.svg" />
					</Grid>
					<Grid item>
						<img alt='C' src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/c/c-original.svg" />
					</Grid>
					<Grid item>
						<img alt='C++' src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/cplusplus/cplusplus-original.svg" />
					</Grid>
					<Grid item>
						<img alt='javascript' src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg" />
					</Grid>
					<Grid item>
						<img alt='reactJS' src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/react/react-original.svg" />
					</Grid>
				</Grid>
				<Grid container justifyContent='center' spacing={3} className={ cls.skillContainer }>
					<Grid item>
						<img alt='Php' src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/php/php-original.svg" />
					</Grid>
					<Grid item>
						<img alt='mysql' src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mysql/mysql-original.svg" />
					</Grid>
					<Grid item>
						<img alt='git' src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" />
					</Grid>
					<Grid item>
						<img alt='docker' src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" />
					</Grid>
					<Grid item>
						<img alt='nginx' src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nginx/nginx-original.svg" />
					</Grid>
				</Grid>
			</Container>
		</Container>
	)	
}