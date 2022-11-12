import { Container, Paper, Typography } from "@mui/material";
import { makeStyles } from "@mui/styles";

const useStyles = makeStyles((theme : Theme) => ({
	introduction: {
		textAlign: 'center',
		marginTop: 100,
		marginBottom: 50,
		'& > h3': {
			fontWeight: 600,
		}
	},
	statsContainer: {
		marginTop: 75,
		backgroundColor: theme.palette.background.default,
	},
}));

export function Introduction() {
	const cls = useStyles();

	return (
		<Container maxWidth="md" className={ cls.introduction }>
			<Typography variant="h3">
				$Hello,
			</Typography>
			<Typography paddingLeft="40px">
				$Welcome to my CV page !
			</Typography>
		</Container>
	)
}
